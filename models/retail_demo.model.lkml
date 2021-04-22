connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"

datagroup: retail_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: retail_demo_default_datagroup

explore: omni_channel_support_calls__messages {}

explore: omni_channel_support_calls {
  # hidden: yes

  join: omni_channel_support_calls__messages {
    view_label: "Omni Channel Support Calls: Messages"
    sql: LEFT JOIN UNNEST(${omni_channel_support_calls.messages}) as omni_channel_support_calls__messages ;;
    relationship: one_to_many
  }
}
