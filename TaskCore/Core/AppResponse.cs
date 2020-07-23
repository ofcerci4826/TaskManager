using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace TaskCore.Core
{
    public class AppResponse
    {
        public static string Return(string dbresult)
        {
            if (string.IsNullOrEmpty(dbresult))
                return JsonConvert.SerializeObject(new { Status = 298, Result = "İşlem başarısız." });

            if ("SUCCEED".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 200 });

            if ("HEADER_TOKEN_FAILER".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 700, Result = "Header Token Failed" });

            if ("ALREADY_EXISTS".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 201, Result = "Böyle bir kayıt sistemde zaten var." });

            if ("FAILED".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 299, Result = "İşlem başarısız." });

            if ("WRONG_EMAIL".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 300, Result = "Lütfen Geçerli Bir Email Adresi Giriniz." });
          
            if ("ALREADY_USERNAME".Equals(dbresult))
                return JsonConvert.SerializeObject(new { Status = 301, Result = "Bu kullanıcı adı ile daha önceden kayıt olunmuş. Lütfen farklı bir kullanıcı adı giriniz." });

            if (dbresult.Contains("SUCCEED_ID_"))
                return JsonConvert.SerializeObject(new { Status = 199, Id = dbresult.Replace("SUCCEED_ID_", "") });

            if (dbresult.Contains("SUCCEED_ID_"))
                return JsonConvert.SerializeObject(new { Status = 199, Id = dbresult.Replace("SUCCEED_ID_", "") });

            return JsonConvert.SerializeObject(new { Status = 297, Result = "İşlem başarısız." });
        }

        public static string Return(int status, object obj = null)
        {
            return JsonConvert.SerializeObject(new { Status = status, Result = obj });
        }

    }
}
