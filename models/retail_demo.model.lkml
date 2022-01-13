connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"
include: "/explore/explore_refinments.explore"


datagroup: retail_demo_default_datagroup {
   sql_trigger: select count(*) from `daveward-ps-dev.daveward_demodataset.products`;;
  max_cache_age: "1 hour"
}

datagroup: inventory_items_data_group {
  sql_trigger: select count(*) from `daveward-ps-dev.daveward_demodataset.inventory_items` ;;
}

persist_with: retail_demo_default_datagroup


explore: omni_channel_support_calls {
  # hidden: yes

  join: omni_channel_support_calls__messages {
    view_label: "Omni Channel Support Calls: Messages"
    sql: LEFT JOIN UNNEST(${omni_channel_support_calls.messages}) as omni_channel_support_calls__messages ;;
    relationship: one_to_many
  }
}


explore: inventory_items {
}

explore: inventory_items_names {
  hidden: yes
}

explore: products {
  query: top_ten_brands {
    dimensions: [products.brand]
    measures: [products.total_cost]
  }
  group_label: "Retail Demo"
}

explore: order_items {}

explore: inventory_items_by_year {
  hidden: yes
}
