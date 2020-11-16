using System;
using System.Collections.Generic;

namespace AssemblyCSharp.Assets.Amplitude
{
    [System.Serializable]
    public class Bundle
    {
        public string bundle_id;
        public float price;
        public string currency;
        public string payment_type;
        public string display_price;
        public string data;

        public Bundle()
        {
        }
    }
}
