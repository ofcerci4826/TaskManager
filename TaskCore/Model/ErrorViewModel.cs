using System;
using System.Collections.Generic;
using System.Text;

namespace TaskCore.Model
{
    public class ErrorViewModel
    {
        public int Status { get; set; }
        public string RequestId { get; set; }
        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }
}
