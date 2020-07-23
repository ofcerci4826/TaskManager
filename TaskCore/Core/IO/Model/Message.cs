using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TaskCore.Core.IO.Model
{
  public class Message
    {
        public string Path { get; set; }
        public string Text { get; set; }
        public FileMode Mode { get; set; }
        public bool AddNewLine { get; set; }
    }
}
