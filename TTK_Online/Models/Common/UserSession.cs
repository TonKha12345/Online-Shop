﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Common
{
    [Serializable]
    public class UserSession
    {
        public string UserName { get; set; }
        public string GroupID { get; set; }
    }
}
