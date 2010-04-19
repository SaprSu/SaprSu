using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace SULibrary
{
    public class FileLogger : ILogger
    {
        #region ILogger Members

        public void Log(string message)
        {
            Directory.CreateDirectory("Logs");
            using (StreamWriter wr = File.CreateText("Logs\\" + DateTime.Now.ToString().Replace(":", string.Empty) + ".log"))
            {
                wr.Write(message);
                wr.Close();
            }
        }

        #endregion
    }
}
