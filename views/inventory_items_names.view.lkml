view: inventory_items_names {
  derived_table: {
    sql: select PRODUCT_DEPARTMENT ,PRODUCT_CATEGORY ,PRODUCT_BRAND,product_name   from `daveward-ps-dev.daveward_demodataset.inventory_items` group by 1,2,3,4
      ;;
      datagroup_trigger: inventory_items_data_group
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.PRODUCT_DEPARTMENT ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.PRODUCT_BRAND ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  set: detail {
    fields: [product_department, product_category, product_brand, product_name]
  }
}
