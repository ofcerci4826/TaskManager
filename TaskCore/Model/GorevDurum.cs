using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TaskCore.Database;
using TaskCore.NetCore.Utils;

namespace TaskCore.Model
{

    public class GorevDurum
    {
        public int Id { get; set; }
        public string Durum { get; set; }
        public string Renk { get; set; }

        public static GorevDurum Parse(DataRow row)
        {
            return new GorevDurum
            {
                Id = row.GetInteger("Id"),
                Durum = row.GetString("Durum"),
                Renk = row.GetString("Renk"),
                
            };
        }

        public static List<GorevDurum> Listele()
        {
            return Sql.GetInstance().List("sp_gorev_durum_listesi", null, (row) =>
            {
                return Parse(row);
            });
        }
    }
}
