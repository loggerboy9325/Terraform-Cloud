const API_URL =
  "https://dv61tts9th.execute-api.us-east-1.amazonaws.com/test/visitorcounter";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.json();
  console.log(json.body);
  const body = json.body;
  document.getElementById("visit").insertAdjacentHTML("afterbegin", body);
}
getvisitors();
