using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Networking;
using AssemblyCSharp.Assets.Amplitude;

public class Bar : MonoBehaviour {
	private List<Bundle> bundles = new List<Bundle>();

	// Use this for initialization
	void Start () {
		StartCoroutine(Amplitude.getInstance().GetRecommendedBundle(bundle => bundles.Add(bundle)));
	}

	// Update is called once per frame
	void Update () {

	}

	void OnGUI () {

		// Make a background box
		GUI.Box(new Rect(10,10,200,200), "Demo menu");

		
		if(GUI.Button(new Rect(20,40,180,20), "View bundle")) {
			Amplitude amplitude = Amplitude.Instance;

			amplitude.bundleViewOpen(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 60, 180, 20), "Close bundle"))
		{
			Amplitude amplitude = Amplitude.Instance;

			amplitude.bundleViewClose(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 80, 180, 20), "Begin bundle purchase"))
		{
			Amplitude amplitude = Amplitude.Instance;

			amplitude.bundlePurchaseBegin(bundles[0]);
		}

		if (GUI.Button(new Rect(20, 100, 180, 20), "Complete bundle purchase"))
		{
			Amplitude amplitude = Amplitude.Instance;

			amplitude.bundlePurchaseCompleted(bundles[0], "my receipt");
		}

		if (GUI.Button(new Rect(20, 120, 180, 20), "Abort bundle purchase"))
		{
			Amplitude amplitude = Amplitude.Instance;

			amplitude.bundlePurchaseAborted(bundles[0]);
		}
	}
}
