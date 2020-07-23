using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TaskCore.Database;
using TaskCore.NetCore.Utils;

namespace TaskCore.Model
{
    public class GorevYoneticisi
    {
        public List<GorevResource> Resource { get; set; }
        public List<GorevEvent> Event { get; set; }


        public static GorevYoneticisi Listesi()
        {

            GorevYoneticisi gorevYoneticisi = new GorevYoneticisi();
           
            Sql.GetInstance().Set("sp_gorev_listesi",null, (ds) =>
            {
                if (ds.Tables.Count <= 0)
                    return;

                if (ds.Tables[0].Rows.Count <= 0)
                    return;

                gorevYoneticisi.Resource = new List<GorevResource>();
                gorevYoneticisi.Event = new List<GorevEvent>();

                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                        gorevYoneticisi.Resource.Add(GorevResource.Parse(row));
                }

                if (ds.Tables.Count > 1)
                {
                    foreach (DataRow row in ds.Tables[1].Rows)
                        gorevYoneticisi.Event.Add(GorevEvent.Parse(row));
                }

                Sql.ResetInstance();
            });

            return gorevYoneticisi;
        }



    }
}
