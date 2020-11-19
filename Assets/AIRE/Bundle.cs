using System;
using System.Collections.Generic;

namespace AssemblyCSharp.Assets.AIRE
{

    public class Bundle
    {
        public class BundleViewEvent
        {
            public long duration;
            public long start_time;
            public string event_group_id;

            public BundleViewEvent(string bundleId)
            {
                duration = 0;
                start_time = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
                event_group_id = start_time.ToString() + ":" + bundleId;
            }
        }

        public class BundlePurchaseEvent
        {
            public long duration;
            public long start_time;
            public string event_group_id;

            public BundlePurchaseEvent(string bundleId)
            {
                duration = 0;
                start_time = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
                event_group_id = start_time.ToString() + ":" + bundleId;
            }
        }

        public string bundle_id;
        public decimal price;
        public string currency;
        public string payment_type;
        public string display_price;
        public string data;

        public BundleViewEvent view_event;
        public BundlePurchaseEvent purchase_event;

        public Bundle()
        {
            view_event = null;
            purchase_event = null;
        }
    }
}
