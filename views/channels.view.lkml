view: channels {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.channels`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  measure: count {
    label: "Count of Channels"
    type: count
    drill_fields: [id, name, transaction_detail.count]
  }
}
