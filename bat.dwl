import * from bat::BDD
import * from bat::Assertions
import * from bat::Mutable

---

suite("order-test-suite") in [
	
  it("Obtains all orders data") in[
    GET `https://ordertestapi-w78yhd.2ky31l-2.deu-c1.eu1.cloudhub.io/orders` with {
      "headers": {
      	"Accept" : "application/json"
      }
    } assert [
        $.response.status mustEqual 200,
        $.response.headers.'Content-Type' mustEqual "application/json; charset=UTF-8",
        $.response.body.status mustEqual "created"
    ]
  ],
  
 it("Creates an order") in[
    POST `https://ordertestapi-w78yhd.2ky31l-2.deu-c1.eu1.cloudhub.io/orders` with {
      "headers": {
      	"Accept" : "application/json",
      	"Content-Type" : "application/json",
      	"Content-Length" : 0
      },
      "body" : {
      }
    } assert [
        $.response.status mustEqual 200,
        $.response.body.message mustEqual "Order Created"
    ] execute [
      log($.response) // <--- Then we’ll log the response
    ]
  ]
]
