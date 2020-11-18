using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AIREDemo : MonoBehaviour {

	// Use this for initialization
	void Awake () {
		AIRE aire = AIRE.getInstance();
		aire.setServerUrl("https://2ceg9ozg2i.execute-api.eu-west-1.amazonaws.com/Prod/ingestion/aire-sdk");
		aire.logging = true;
		
		aire.init("e7177d872ff62c0356c973848c7bffba");
	}

	void Start() {

	}

	// Update is called once per frame
	void Update () {

	}

	public void OnApplicationFocus(bool focus) {}

	public void OnApplicationPause(bool pause) {}

	public void onApplicationQuit() {
	}
}
