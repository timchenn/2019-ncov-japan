output$renderCalendar <- renderUI({
  if (input$linePlot == "confirmed") {
    if (is.null(input$regionPicker)) {
      tags$p("未選択です。地域を選択してください。")
    } else {
      tagList(
        echarts4rOutput("confirmedCalendar", height = "130px"),
        calendarDateRangePicker("confirmCalendarDateRange")
      )
    }
  } else {
    tagList(tags$p("開発中"))
  }
})

output$callCenterCanlendar <- renderEcharts4r({
  dt <- callCenterDailyReport
  setnafill(dt, fill = 0)
  dt <- data.table(
    "date" = dt$date,
    "count" = dt$call + dt$mail + dt$fax
  )
  maxValue <- max(dt$count)
  dt %>%
    e_charts(date) %>%
    e_calendar(
      range = input$callCenterCalendarDateRange,
      top = 25,
      left = 25,
      cellSize = 15,
      splitLine = list(show = F),
      itemStyle = list(borderWidth = 2, borderColor = "#FFFFFF"),
      dayLabel = list(nameMap = switch(
        languageSetting,
        "ja" = c("日", "月", "火", "水", "木", "金", "土"),
        "cn" = "cn",
        "en" = "en"
      )),
      monthLabel = list(nameMap = ifelse(languageSetting != "en", "cn", "en"))
    ) %>%
    e_heatmap(count, coord_system = "calendar", name = lang[[langCode]][80]) %>%
    e_legend(show = F) %>%
    e_visual_map(
      top = "15%",
      max = maxValue,
      show = F,
      inRange = list(color = c("#FFFFFF", darkBlue)),
      # scale colors
    ) %>%
    e_tooltip(
      formatter = htmlwidgets::JS(
        "
        function(params) {
          return(`${params.value[0]}<br>新規${params.value[1]}人`)
        }
      "
      )
    )
})