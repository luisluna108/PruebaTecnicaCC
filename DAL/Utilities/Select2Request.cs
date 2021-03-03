using DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Utilities
{
    public class Select2Request
    {
        public string search { get; set; }
        public string _type { get; set; }
        public int page { get; set; }
        public int length { get; set; }
        public string extraParam { get; set; }
        public int recordsfiltered { get; set; }


    }
}
