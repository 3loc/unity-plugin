using System;
using System.Collections.Generic;

namespace AssemblyCSharp.Assets.Amplitude
{

    public class Bundle
    {
        public class BundleViewEvent
        {
            public long duration;
            public long start_time;

            public BundleViewEvent()
            {
                duration = 0;
                start_time = System.DateTime.UtcNow.Ticks;
            }
        }

        public class BundlePurchaseEvent
        {
            public long duration;
            public long start_time;

            public BundlePurchaseEvent()
            {
                duration = 0;
                start_time = System.DateTime.UtcNow.Ticks;
            }
        }

        public string bundle_id;
        public decimal price;
        public string currency;
        public string payment_type;
        public string display_price;
        public string data;
        public string event_group_id;

        public BundleViewEvent view_event;
        public BundlePurchaseEvent purchase_event;

        public Bundle()
        {
            view_event = null;
            purchase_event = null;
        }
    }
}
