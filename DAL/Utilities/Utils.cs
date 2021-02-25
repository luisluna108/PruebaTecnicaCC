using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Utilities
{
    public class DataTableJS
    {
        [JsonProperty("draw")]
        public int Draw { get; set; }
        [JsonProperty("columns")]
        public List<Column> Columns { get; set; }
        [JsonProperty("start")]
        public int Start { get; set; }
        [JsonProperty("length")]
        public int Length { get; set; }
        [JsonProperty("order")]
        public List<Order> Order { get; set; }
        [JsonProperty("search")]
        public Search Search { get; set; }
        [JsonProperty("searchFilter")]
        public string SearchFilter { get; set; }
    }
    public class Column
    {
        [JsonProperty("data")]
        public int Data { get; set; }
        [JsonProperty("name")]
        public string Name { get; set; }
        [JsonProperty("searchable")]
        public bool Searchable { get; set; }
        [JsonProperty("orderable")]
        public bool Orderable { get; set; }
        [JsonProperty("search")]
        public Search search { get; set; }
        [JsonProperty("searchFilter")]
        public string SearchFilter { get; set; }
    }

    public class Search
    {
        [JsonProperty("value")]
        public string Value { get; set; }
        [JsonProperty("regex")]
        public bool Regex { get; set; }
    }

    public class Order
    {
        [JsonProperty("column")]
        public int Column { get; set; }
        [JsonProperty("dir")]
        public string Dir { get; set; }
    }
}
