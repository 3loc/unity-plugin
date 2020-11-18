# Unity SDK Code

Address to lambda function to capture incoming data (For Ted)
```
https://eu-west-1.console.aws.amazon.com/lambda/home?region=eu-west-1#/functions/aire-ingestion-AIREIngestionSDKFunction-ESH3L2DUW41L?tab=monitoring
```

```csharp
	public void bundleViewBegin(Bundle bundle) {
         // Reset existing bundle_view_start_time, event_group_id and duration (use substruct)
        // TODO: Set bundle_view_start_time, event_group_id
        bundle.view_state = null
        bundle.view_state.bundle_view_start_time = timestamp
        bundle.view_state.bundle_purchase_start_time = timestamp
		bundleProps.Add("bundle", serializeBundle(bundle));
		logEvent("bundle.view.open", bundleProps);
        // Flush
	}

    public void bundleViewEnd(Bundle bundle) {
        // TODO: set duration based on bundle_view_start_time and current time
		logEvent("bundle.view.close", bundleProps);
	}


	public void bundlePurchaseBegin(Bundle bundle)  {
         // Reset existing bundle_purchase_view_start_time, event_group_id and duration (use substruct)
        // TODO: set seperate start_time from bundle_view
        // event_group_id (same as bundle view)
		logEvent("bundle.purchase.begin", bundleProps);
    }


	public void bundlePurchaseAborted(Bundle bundle) {
        // TODO: set duration based on bundle purchase start_time and current time
        // event_group_id (same as bundle view)
		logEvent("bundle.purchase.aborted", bundleProps);
    }

    // Some users might not want to send complete reciept, bundle_purchase_reciept_id is okay in that case (suggest polymorpchic function one for id and one for reciept)
    // Reciept_id means something we can use to verify the payment was sent
	public void bundlePurchaseCompleted(Bundle bundle, (Reciept reciept|| reciept_id)) {
		IDictionary<string, object> bundleProps = new Dictionary<string, object>();
        // TODO: Add reciept to event
        // TODO: set duration based on bundle purchase start_time and current time
        // event_group_id (same as bundle view)
		bundleProps.Add("bundle", serializeBundle(bundle));

		logEvent("bundle.purchase.completed", bundleProps);
	}


    // TODO: Consider removing for v0 and adding back in v0.1
	public void bundleConsume(Bundle bundle) { }


	public void setUserProgressLevel(int level) {
		IDictionary<string, object> progressLevel = new Dictionary<string, object>();

		progressLevel.Add("new_user_level", newLevel);
		progressLevel.Add("old_user_level", oldLevel);

        // TODO: Change event name
        // TODO : set global property (user property) to be sent on all events
        // Send: Old level and new level
		logEvent("user.level.change", progressLevel, oldProgressLevel);
	}

```

```csharp=using System;
using System.Collections.Generic;

namespace AssemblyCSharp.Assets.Amplitude
{
    public class Bundle
    // TODO: Add substruct for purchase and view datapoints
    {
        public string bundle_id;
        public decimal price;
        public string currency;
        public string payment_type;
        public string display_price;
        public string data;

        public Bundle()
        {
        }
    }
}
```
