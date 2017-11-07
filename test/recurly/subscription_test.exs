defmodule Recurly.SubscriptionTest do
  use ExUnit.Case, async: true
  alias Recurly.Subscription
  import Utils

  @readable_fields ~w(
    account
    activated_at
    bank_account_authorized_at
    bulk
    canceled_at
    collection_method
    converted_at
    coupon_code
    currency
    current_period_started_at
    customer_notes
    expires_at
    first_renewal_date
    invoice
    net_terms
    plan
    plan_code
    po_number
    quantity
    revenue_schedule_type
    started_with_gift
    starts_at
    state
    subscription_add_ons
    tax_in_cents
    tax_rate
    tax_region
    tax_type
    terms_and_conditions
    total_billing_cycles
    trial_ends_at
    unit_amount_in_cents
    updated_at
    uuid
    vat_reverse_charge_notes
  )a

  @writeable_fields ~w(
    account
    bank_account_authorized_at
    bulk
    collection_method
    coupon_code
    currency
    current_period_started_at
    customer_notes
    first_renewal_date
    net_terms
    plan
    plan_code
    po_number
    quantity
    revenue_schedule_type
    started_with_gift
    starts_at
    subscription_add_ons
    tax_in_cents
    tax_rate
    tax_region
    tax_type
    terms_and_conditions
    total_billing_cycles
    trial_ends_at
    unit_amount_in_cents
    uuid
    vat_reverse_charge_notes
  )a

  test "should maintain the list of writeable fields" do
    compare_writeable_fields(Subscription, @writeable_fields)
  end

  test "should maintain the list of readable fields" do
    compare_readable_fields(Subscription, @readable_fields)
  end

  test "Subscription#path should resolve to the subscriptions endpoint" do
    uuid = "abcdef1234567890"
    assert Subscription.path(uuid) == "/subscriptions/#{uuid}"
  end
end
