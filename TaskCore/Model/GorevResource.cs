using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TaskCore.Database;

namespace TaskCore.Model
{

    public class GorevResource
    {
        public long id { get; set; }
        public string AdSoyad { get; set; }

        public static GorevResource Parse(DataRow row)
        {
            return new GorevResource
            {
                id = row.GetLong("Id"),
                AdSoyad = row.GetString("AdSoyad"),
            };
        }
    }
}
