Component.SymptomsProgression <- function() {
  box(
    title = tagList(icon("hospital"), i18n$t("症状の進行")),
    width = 8,
    closable = F,
    collapsible = T,
    collapsed = T,
    label = boxLabel("Archived", status = "danger"),
    dateInput(
      inputId = "selectProcessDay",
      label = i18n$t("日付選択"),
      min = domesticDailyReport$date[1],
      max = domesticDailyReport$date[nrow(domesticDailyReport)],
      value = domesticDailyReport$date[nrow(domesticDailyReport)],
      language = languageSetting
    ),
    tags$small(i18n$t("3月28日以後、厚労省集計方法が変更あり、無症状患者の内訳は公表しないため、無症状患者がどのぐらい入院しているかの情報がなくなりました。こちらではグラフ作成するため、無症状者は一律入院必要ないという仮説を設定した上で、グラフを作りました。よって、該当グラフはあくまで参考です。")),
    tags$br(),
    tags$small(i18n$t("4月22日以後、厚労省集計方法が変更あり、退院者、死亡者数に突合作業中の数値が含まれ、分母（PCR陽性者）と一致しないという説明がありました。こちらではグラフの作成するため、今まで通り確定した人数のみでグラフを作成します。よって、該当グラフはあくまで参考です。")),
    echarts4rOutput("processSankey") %>% withSpinner(),
    footer = tags$small(i18n$t("※開発バージョンです。"))
  )
}
