using UnityEngine;
using System.Collections.Generic;
using AssemblyCSharp.Assets.AIRE;

public class Bar : MonoBehaviour {
	private List<Bundle> bundles = new List<Bundle>();

	// Use this for initialization
	void Start () {
		StartCoroutine(AIRE.getInstance().GetRecommendedBundle(bundle => bundles.Add(bundle)));
	}

	// Update is called once per frame
	void Update () {

	}

	void OnGUI () {

		// Make a background box
		GUI.Box(new Rect(10,10,200,200), "Demo menu");

		
		if(GUI.Button(new Rect(20,40,180,20), "View bundle")) {
			AIRE aire = AIRE.Instance;

			aire.bundleViewOpen(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 60, 180, 20), "Close bundle"))
		{
			AIRE aire = AIRE.Instance;

			aire.bundleViewClose(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 80, 180, 20), "Begin bundle purchase"))
		{
			AIRE aire = AIRE.Instance;

			aire.bundlePurchaseBegin(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 100, 180, 20), "Complete bundle purchase"))
		{
			AIRE aire = AIRE.Instance;

			aire.bundlePurchaseCompleted(bundles[0], "my receipt");
		}

		if (GUI.Button(new Rect(20, 120, 180, 20), "Abort bundle purchase"))
		{
			AIRE aire = AIRE.Instance;

			aire.bundlePurchaseAborted(bundles[0]);
		}
	}
}
