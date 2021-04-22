view: category_lookup {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.category_lookup`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_code {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.category_code ;;
  }

  dimension: item_code {
    hidden: yes
    type: number
    sql: ${TABLE}.item_code ;;
  }

}
