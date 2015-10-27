### A pact between Zoo App and Animal Service

#### Requests from Zoo App to Animal Service

* [A request for an alligator](#a_request_for_an_alligator_given_an_alligator_exists) given an alligator exists

#### Interactions

<a name="a_request_for_an_alligator_given_an_alligator_exists"></a>
Given **an alligator exists**, upon receiving **a request for an alligator** from Zoo App, with
```json
{
  "method": "get",
  "path": "/alligator",
  "query": ""
}
```
Animal Service will respond with:
```json
{
  "status": 200,
  "headers": {
    "Content-Type": "application/json"
  },
  "body": {
    "name": "Mary"
  }
}
```
