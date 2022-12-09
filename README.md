#Test Api#

## Endpoints ##
### v1/ ###
#### GET ####
* v1/drivers - Returns a list of drivers
* v1/drivers/:id - Return an individual driver
* v1/riders - Returns a list of riders
* v1/riders/:id - Return an individual rider
* v1/riders/:id/token-card - Return a token card for a rider
* /v1/riders/:id/payment_source - Return a payment source for a rider
* /v1/riders/:id/request_ride - A Raider can request a ride
* /v1/drivers/:id/finish_ride - A driver can finish a ride

### Flow ###
* Rider (id:7) (The raider has'nt a payment source)
![img_1.png](img_1.png)

* Rider (id:7) Request a token card
![img_2.png](img_2.png)

* Rider (id:7) Request a payment source (Now the raider has a payment source and a acceptance token)
![img_3.png](img_3.png)

* Rider (id:7) Request a ride (The program asign a free driver to the rider. Is there not a free driver, indicates an error. The ride start at rider position)
![img_4.png](img_4.png)

* Driver (id:1) Finish the ride (The driver finish the ride and the program calculate the price of the ride)

![img_5.png](img_5.png)

* The transaction is generated and paid in Api.

![img_6.png](img_6.png)