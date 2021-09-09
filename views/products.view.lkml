view: products {
  sql_table_name: `daveward_demodataset.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.COST ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.DISTRIBUTION_CENTER_ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: retail_price {
    hidden: yes
    type: number
    sql: ${TABLE}.RETAIL_PRICE ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, inventory_items.count]
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }

  measure: total_price {
    type: sum
    sql: ${retail_price} ;;
    value_format_name: usd_0
  }

  measure: average_price {
    type: average
    sql: ${retail_price} ;;
    value_format_name: usd_0
  }

  measure: total_profit {
    type: sum
    sql: ${retail_price}-${cost} ;;
    value_format_name: usd_0
  }

  measure: margin {
    type: number
    sql: 1.00*${total_profit}/nullif(${total_cost}) ;;
    value_format_name: percent_2
  }



}
