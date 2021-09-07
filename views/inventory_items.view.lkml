view: inventory_items {
  # sql_table_name: `daveward-ps-dev.daveward_demodataset.inventory_items`   ;;

 derived_table: {
    sql:  SELECT * FROM
 {% if created_week._in_query %}
 ${inventory_items_by_week.SQL_TABLE_NAME}
 {% elsif created_month._in_query %}
 ${inventory_items_by_month.SQL_TABLE_NAME}
 {% elsif created_year._in_query %}
 ${inventory_items_by_year.SQL_TABLE_NAME}
 {% else %}
 `daveward-ps-dev.daveward_demodataset.inventory_items`
 {% endif %}
    ;;
    }
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.COST ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.PRODUCT_BRAND ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.PRODUCT_DEPARTMENT ;;
  }

  dimension: product_distribution_center_id {
    hidden: yes
    type: number
    sql: ${TABLE}.PRODUCT_DISTRIBUTION_CENTER_ID ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.PRODUCT_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.PRODUCT_NAME ;;
  }

  dimension: product_retail_price {
    hidden: yes
    type: number
    sql: ${TABLE}.PRODUCT_RETAIL_PRICE ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.PRODUCT_SKU ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.SOLD_AT ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_product_retail_price {
    type: sum
    sql: ${product_retail_price} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id, product_name, products.id, products.name, order_items.count]
  }
}
