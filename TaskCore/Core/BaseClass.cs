using System;
using System.Collections.Generic;
using System.Text;
using TaskCore.Core.IO;

namespace TaskCore.Core
{
    /// <summary>
    /// Base class
    /// </summary>
    public class BaseClass
    {
        /// <summary>
        /// File prefix for tracing and error logging actions
        /// </summary>
        public string LogPrefix { get; set; }

        /// <summary>
        /// Error callback
        /// </summary>
        public Action<Exception> OnError { get; set; }

        /// <summary>
        /// Tracing function
        /// </summary>
        /// <param name="message"></param>
        public void Trace(string message)
        {
            Log.Trace(message, LogPrefix);
        }

        /// <summary>
        /// Error tracing function
        /// </summary>
        /// <param name="ex"></param>
        public void Error(Exception ex)
        {
            Log.Error(ex, LogPrefix);
            OnError?.Invoke(ex);
        }
    }
}
