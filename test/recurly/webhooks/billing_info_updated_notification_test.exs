defmodule Recurly.Webhooks.BillingInfoUpdatedNotificationTest do
  use ExUnit.Case, async: true
  alias Recurly.{Webhooks,Account}

  test "correctly parses payload" do
    xml_doc = """
      <billing_info_updated_notification>
        <account>
          <account_code>1</account_code>
          <username nil="true"></username>
          <email>verena@example.com</email>
          <first_name>Verena</first_name>
          <last_name>Example</last_name>
          <company_name nil="true"></company_name>
        </account>
      </billing_info_updated_notification>
    """

    notification = %Webhooks.BillingInfoUpdatedNotification{} = Webhooks.parse(xml_doc)
    account = %Account{} = notification.account

    assert account.account_code == "1"
    assert account.username == nil
  end
end
