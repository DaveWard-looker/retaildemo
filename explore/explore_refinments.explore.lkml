include: "/models/retail_demo.model"




# Place in `retail_demo` model
explore: +omni_channel_support_calls {
  aggregate_table: rollup__omni_channel_support_calls__messages_issue_subtopic__omni_channel_support_calls__messages_issue_topic {
    query: {
      dimensions: [omni_channel_support_calls__messages.issue_subtopic, omni_channel_support_calls__messages.issue_topic]
      timezone: "America/Mexico_City"
    }

    materialization: {
      datagroup_trigger: retail_demo_default_datagroup
    }
  }
}

# Place in `retail_demo` model
explore: +products {
  aggregate_table: rollup__brand__category__department {
    query: {
      dimensions: [brand, category, department]
      measures: [total_cost, total_price, total_profit]
      timezone: "America/Mexico_City"
    }

    materialization: {
      datagroup_trigger: retail_demo_default_datagroup
    }
  }
}
