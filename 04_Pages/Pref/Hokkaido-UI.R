fluidPage(
  fluidRow(
    column(
      width = 5,
      style = "padding:0px;",
      userBox(
        width = 12,
        title = userDescription(
          title = i18n$t("北海道"),
          subtitle = i18n$t("北海道"),
          type = 2,
          image = "Pref/hokkaido.png"
        ),
        status = "navy",
        collapsible = F,
        sprintf(
          i18n$t(
            "こちらは%sの発生状況をまとめたページです。厚労省のまとめより早く状況を把握できますが、道の集計時間は厚労省の発表時間と完全に一致していないため、タイムラグによる数値の違いが生じる可能性もありますので、予めご注意ください。また、速報では陰性から再び陽性になった人は再計算に含めていないため、自治体発表の陽性者数と数値が異なる場合があります。"
          ),
          i18n$t("北海道")
        ),
        footer = tagList(tags$small(
          icon("database"),
          tags$a(
            href = "https://www.harp.lg.jp/opendata/dataset/1369.html",
            i18n$t("新型コロナウイルス感染症に関するデータ【北海道】")
          )
        ))
      )
    ),
    column(
      width = 7,
      uiOutput("hokkaidoValueBoxes") %>% withSpinner(proxy.height = "200px")
    )
  ),
  fluidRow(
    box(
      width = 12,
      title = tagList(icon("chart-line"), sprintf(i18n$t("%sの発生状況"), i18n$t("北海道"))),
      closable = F,
      fluidRow(
        column(
          width = 6,
          echarts4rOutput("hokkaidoSummaryGraph") %>% withSpinner()
        ),
        column(
          width = 6,
          echarts4rOutput("hokkaidoStackGraph") %>% withSpinner()
        )
      ),
      footer = tags$small(icon("lightbulb"), i18n$t("凡例クリックすると表示・非表示の切替ができます。"))
    )
  )
)
# SIGNATE 問題修復まで非表示
# fluidRow(
#   box(
#     width = 12,
#     closable = F,
#     collapsed = T,
#     collapsible = T,
#     enable_label = T,
#     label_text = tagList('クリックして', icon('hand-point-right')),
#     label_status = 'warning',
#     title = tagList(icon('map-marked-alt'), '道内の感染者'),
#     fluidRow(
#       column(
#         width = 8,
#         leafletOutput('hokkaidoConfirmedMap', height = '500px') %>% withSpinner(),
#         dataTableOutput('hokkaidoPatientTable') %>% withSpinner(),
#       ),
#       column(
#         width = 4,
#         uiOutput('hokkaidoProfile') %>% withSpinner()
#       )
#     )# ,
#     # fluidRow(
#     #   column(
#     #     width = 8,
#     #     dataTableOutput('hokkaidoPatientTable') %>% withSpinner(),
#     #   )
#     # )
#   )
# ))
