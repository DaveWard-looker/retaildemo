view: order_items {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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

  dimension_group: delivered {
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
    sql: ${TABLE}.DELIVERED_AT ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.INVENTORY_ITEM_ID ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.ORDER_ID ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.RETURNED_AT ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.SALE_PRICE ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.SHIPPED_AT ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.USER_ID ;;
  }

  parameter: dynamic_measures {
    type: unquoted
    allowed_value: {
      label: "Count of Users"
      value: "USER_ID"
    }
    allowed_value: {
      label: "Count of Orders"
      value: "ORDER_ID"
    }
    allowed_value: {
      label: "Count of Inventory"
      value: "INVENTORY_ITEM_ID"
    }
  }

  measure: my_measure {
    type: count_distinct
    sql: ${TABLE}.{% parameter dynamic_measures %} ;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Day"
      value: "day"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
  }

  dimension: timeframe {
    type: string
    sql:
    {% if date_granularity._parameter_value == 'day' %}
    ${created_date}
    {% elsif date_granularity._parameter_value == 'week' %}
    ${created_week}
    {% elsif date_granularity._parameter_value == 'month' %}
    ${created_month}
    {% else %}
    ${created_year}
    {% endif %}
    ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, inventory_items.product_name]
  }
}
