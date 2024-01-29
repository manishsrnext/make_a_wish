import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  addToWishlist() {
    debugger;
    const wishId = event.target.getAttribute('data-wish-id');
    const productId = event.target.getAttribute('data-product-id');
    const request = new FetchRequest('post', `http://localhost:3000/wishes/${wishId}/add_product`, {
      body: JSON.stringify({ product_id: productId }),
      body: JSON.stringify({ name: 'Request.JS' })
    })

    const response =  request.perform()
    if (response.ok) {
      const body =  response.text
    }
  }
}