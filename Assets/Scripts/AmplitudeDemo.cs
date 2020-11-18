using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AmplitudeDemo : MonoBehaviour {

	// Use this for initialization
	void Awake () {
		Debug.Log ("awake");
		Amplitude amplitude = Amplitude.getInstance();
		amplitude.setServerUrl("https://2ceg9ozg2i.execute-api.eu-west-1.amazonaws.com/Prod/ingestion/aire-sdk");
		amplitude.logging = true;
		amplitude.trackSessionEvents(true);
		amplitude.useAdvertisingIdForDeviceId();
		amplitude.init("e7177d872ff62c0356c973848c7bffba");
		Debug.Log(amplitude.getDeviceId());

		Dictionary<string, bool> trackingOptions = new Dictionary<string, bool>();
		trackingOptions.Add("disableCity", true);
		trackingOptions.Add("disableIPAddress", true);
		trackingOptions.Add("disableIDFV", true);
		trackingOptions.Add("disableIDFA", true);
		trackingOptions.Add("disableCountry", true);

		// Flush all the events immediately.
		amplitude.uploadEvents();
	}

	void Start() {

	}

	// Update is called once per frame
	void Update () {

	}

	public void OnApplicationFocus(bool focus) {}

	public void OnApplicationPause(bool pause) {}

	public void onApplicationQuit() {
		Debug.Log ("Quitting application - attempting to log amplitude event");
		Amplitude.Instance.logEvent ("session over");
	}
}
