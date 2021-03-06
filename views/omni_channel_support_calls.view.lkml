
view: omni_channel_support_calls {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.omni_channel_support_calls`
    ;;

  dimension: agent_id {
    hidden: yes
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: conversation_end {
    hidden: yes
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
    sql: ${TABLE}.conversation_end_at ;;
  }

  dimension: conversation_id {
    hidden: yes
    type: string
    sql: ${TABLE}.conversation_id ;;
  }

  dimension_group: conversation_start {
    hidden: yes
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
    sql: ${TABLE}.conversation_start_at ;;
  }

  dimension_group: conversation {
    type: duration
    intervals: [second,minute,hour]
    sql_start: ${conversation_start_raw} ;;
    sql_end: ${conversation_end_raw} ;;
  }

  dimension: messages {
    hidden: yes
    sql: ${TABLE}.messages ;;
  }

  dimension: resolved_on_call {
    type: string
    sql: ${TABLE}.resolved_on_call ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: omni_channel_support_calls__messages {
  dimension: answer_end {
    type: number
    sql: ${TABLE}.answer_end ;;
  }

  dimension: answer_start {
    type: number
    sql: ${TABLE}.answer_start ;;
  }

  dimension: intent_id {
    type: string
    sql: ${TABLE}.intent_id ;;
  }

  dimension: issue_subtopic {
    type: string
    sql: ${TABLE}.issue_subtopic ;;
  }

  dimension: issue_topic {
    type: string
    sql: ${TABLE}.issue_topic ;;
  }

  dimension: live_agent_speaking {
    type: yesno
    sql: ${TABLE}.live_agent_speaking ;;
  }

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
  }

  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
  }

  dimension: row {
    type: number
    sql: ${TABLE}.row ;;
  }

  dimension: sentiment {
    type: number
    sql: ${TABLE}.sentiment ;;
  }

  dimension: user_end {
    type: number
    sql: ${TABLE}.user_end ;;
  }

  dimension: user_question {
    type: string
    sql: ${TABLE}.user_question ;;
  }

  dimension: user_start {
    type: number
    sql: ${TABLE}.user_start ;;
  }
}
