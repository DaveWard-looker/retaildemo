include: "/models/retail_demo.model"
include: "/views/**/*.view"
include: "/explore/products.explore"


explore: +products {
  sql_always_where: ${brand} = 'Ray Bans' ;;
}


explore: +inventory_items {
  sql_always_where: ${product_brand} = 'Ray Ban' ;;
}



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
