using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace SULibrary
{
    public class EventLogLogger : ILogger
    {
        #region ILogger Members

        public void Log(string message)
        {
            EventLog.WriteEntry("SU", message, EventLogEntryType.Information);
        }

        #endregion
    }
}