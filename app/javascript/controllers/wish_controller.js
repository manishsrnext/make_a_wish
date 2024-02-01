import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  addToWishlist(event) {
    const productId = event.target.getAttribute('data-product-id');
    const requestBody = JSON.stringify({
      wish: {
        product_id: productId,
      }
    });

    const request = new FetchRequest('post', `http://localhost:3000/add_product`, {
      body: requestBody,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    });
    request.perform()
      .then(response => {
        debugger;
        console.log("Full response object:", response);

        if (response.ok) {
          if (typeof response.json === 'function') {
            return response.json();
          } else {
            return response.responseJson;
          }
        } else {
          throw new Error('Request failed with status: ' + response.status);
        }
      })
      .then(responseBody => {
        debugger

        console.log("product added to wish");
        window.location.href = `/`;
      })
      .catch(error => {
        console.error('Network or other error:', error);
      });
  }
}
