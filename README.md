![ms-digital-labs](https://image.ibb.co/fDufp8/Screen_Shot_2018_07_13_at_23_03_10.png
)

**By Baron Bloomer**

### Requirements

M&S Digital Labs have decided to open a hyper-focussed online shop that sells
only three things - jeans, blouses, and socks. Each product has a corresponding
product code and price:

| Product | Code | Price |
| ------- | ---- | ----- |
| Jeans | J01 | £32.95 |
| Blouse | B01 | £24.95 |
| Socks | S01 | £7.95 |

To try and incentivise customers to spend more with us, the delivery charges are
staggered. For orders under £50, delivery costs £4.95. For orders under £90,
delivery costs £2.95. Orders over £90 have free delivery.

We're also experimenting with special offers. The initial offer will be “buy one pair,
get another pair half price” on jeans.

The final piece of code to write is the basket, which needs to have the following
interface:
* It is initialised with the product catalog, delivery charge rules, and offers (the
format of how these are passed is up to you)
* It has an add method that takes the product code as a parameter
* It has a total method that returns the total cost of the basket, taking into
account the delivery and offer rules

So that you can check your implementation, here are some example baskets and
the expected totals:

| Products | Basket Total |
| -------- | ------------ |
| S01, B01 | £37.85 |
| J01, J01 | £54.37 |
| J01, B01 | £60.85 |
| S01, S01, J01, J01, J01 | £98.27 |

## Solution

I have chosen to create a small Rails application with ActiveRecord over a Ruby gem for the purpose that this project can be extended in the future if need be and the nature of such a project in my opinion would serve well as a web based application.
Furthermore, the task requires states for an UI component and a web interface is much more user-friendly than a CLI interface.

### Models

The annotate gem has been implemented in order to clearly display the table columns within each model file.

**Basket**

A basket can hold a number of basket items i.e. products

**BasketItem**

Facilitates baskets with the ability to store products. It's not required by the task, however it may be a good idea to add a `quantity` column to this table to more efficiently manage products within a basket.

**Product**

Stores all the information for each product as required by the task. An index has been created for the `code` column as the task requires products be searchable by their code and thus is more performant particularly as the product database becomes larger.

### Service Objects

**BasketPriceCalculator**

Receives an instance of basket and calculates `product_total`, `delivery_price`, and `basket_total` for that basket. These methods are available on the `Basket` model provided via the `BasketPriceCalculation` mixin.

### Query Objects

**ProductCatalogueQuery**

Provides logic for querying all products or products by their code. The `#products` query should include pagination for performance benefit but is not in the scope of the task.
