Rails.configuration.stripe = {
  :publishable_key => 'pk_test_f8HQxwbyx8mtLWYx0mwJuXVP',
  :secret_key      => 'sk_test_NRWZyyPD4K2MefzEty1fm7ZN'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]