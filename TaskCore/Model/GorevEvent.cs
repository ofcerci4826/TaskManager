using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TaskCore.Database;
using TaskCore.NetCore.Utils;

namespace TaskCore.Model
{

    public class GorevEvent
    {
        public long id { get; set; }
        public long resourceId { get; set; }
        public long refKullanici { get; set; }
        public DateTime start { get; set; }
        public DateTime end { get; set; }
        public string GorevAd { get; set; }
        public int refDurum { get; set; }
        public string Durum { get; set; }
        public string color { get; set; }
        public string title { get; set; }
        public string Not { get; set; }

        public static GorevEvent Parse(DataRow row)
        {
            return new GorevEvent
            {
                id = row.GetLong("Id"),
                resourceId = row.GetLong("refKullanici"),
                refKullanici = row.GetLong("refKullanici"),
                start = row.GetDatetime("Baslangic"),
                end = row.GetDatetime("Bitis"),
                GorevAd = row.GetString("GorevAd"),
                title = row.GetString("GorevAd"),
                refDurum = row.GetInteger("refDurum"),
                Durum = row.GetString("Durum"),
                color = row.GetString("Renk"),
                Not = row.GetString("Not"),

            };
        }

        public bool IsValid(bool isUpdate = false)
        {
            if (isUpdate && id <= 0)
                return false;

            if (string.IsNullOrEmpty(GorevAd))
                return false;

            if (isUpdate && refDurum <= 0)
                return false;

            if (isUpdate && refKullanici <= 0)
                return false;

            return true;
        }

        public static string Olustur(GorevEvent param)
        {
            return Sql.GetInstance().Get("sp_gorev_olustur", new List<object> {
                param.refKullanici,
                Convert.ToDateTime( param.start),
                Convert.ToDateTime( param.end),
                param.GorevAd,
                param.refDurum,
                param.Not
                }, (row) =>
                {
                    return row.GetString("Result");
                });
        }

        public static GorevEvent Detay(int Id)
        {
            GorevEvent detay = new GorevEvent();
            Sql.GetInstance().Set("sp_gorev_detay", new List<object> { Id }, (ds) =>
            {
                if (ds.Tables.Count <= 0)
                    return;

                if (ds.Tables[0].Rows.Count <= 0)
                    return;

                detay = Parse(ds.Tables[0].Rows[0]);

               

            });

            return detay;

        }

        public static string Guncelle(GorevEvent param)
        {

            return Sql.GetInstance().Get("sp_gorev_guncelle", new List<object> {
                param.id,
                param.refKullanici,
                Convert.ToDateTime( param.start),
                Convert.ToDateTime( param.end),
                param.GorevAd,
                param.refDurum,
                param.Not
                }, (row) =>
                {
                    return row.GetString("Result");
                });
        }
    }
}
