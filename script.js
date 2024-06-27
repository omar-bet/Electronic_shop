document.addEventListener('DOMContentLoaded', () => {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];

    function updateCart() {
        localStorage.setItem('cart', JSON.stringify(cart));
    }

    // إضافة المنتجات إلى سلة التسوق
    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', () => {
            const id = button.dataset.id;
            const name = button.dataset.name;
            const price = parseFloat(button.dataset.price);

            const existingItem = cart.find(item => item.id === id);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({ id, name, price, quantity: 1 });
            }
            updateCart();
            alert(`${name} has been added to your cart`);
        });
    });

    // عرض العناصر في سلة التسوق
    const cartItemsContainer = document.getElementById('cart-items');
    if (cartItemsContainer) {
        cart.forEach(item => {
            const cartItem = document.createElement('div');
            cartItem.className = 'cart-item';
            cartItem.innerHTML = `
                <span>${item.name}</span>
                <span>Quantity: ${item.quantity}</span>
                <span>Price: ${item.price}</span>
                <button class="remove-from-cart" data-id="${item.id}">Remove</button>
            `;
            cartItemsContainer.appendChild(cartItem);
        });

        // إزالة العناصر من سلة التسوق
        document.querySelectorAll('.remove-from-cart').forEach(button => {
            button.addEventListener('click', () => {
                const id = button.dataset.id;
                const index = cart.findIndex(item => item.id === id);
                if (index > -1) {
                    cart.splice(index, 1);
                    updateCart();
                    location.reload();
                }
            });
        });
    }

    // عرض العناصر في صفحة الدفع
    const checkoutItemsContainer = document.getElementById('checkout-items');
    if (checkoutItemsContainer) {
        cart.forEach(item => {
            const checkoutItem = document.createElement('div');
            checkoutItem.className = 'checkout-item';
            checkoutItem.innerHTML = `
                <span>${item.name}</span>
                <span>Quantity: ${item.quantity}</span>
                <span>Price: ${item.price}</span>
            `;
            checkoutItemsContainer.appendChild(checkoutItem);
        });

        const totalPrice = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        const totalPriceElement = document.createElement('div');
        totalPriceElement.className = 'total-price';
        totalPriceElement.innerHTML = `Total Price: ${totalPrice}$`;
        checkoutItemsContainer.appendChild(totalPriceElement);

        // إتمام عملية الشراء
        const checkoutForm = document.getElementById('checkout-form');
        checkoutForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const name = document.getElementById('name').value;
            const address = document.getElementById('address').value;

            if (name && address) {
                alert('Purchase completed successfully');
                localStorage.removeItem('cart');
                location.href = 'index.html';
            } else {
                alert('Please fill in all the fields');
            }
        });
    }
});
