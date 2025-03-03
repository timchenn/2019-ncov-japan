fluidPage(
  fluidRow(
    column(
      width = 5, style = "padding:0px;",
      userBox(
        title = userDescription(
          title = i18n$t("福岡県"),
          subtitle = i18n$t("九州地方"),
          type = 2,
          image = "Pref/fukuoka.png"
        ),
        width = 12,
        status = "navy",
        collapsible = F,
        sprintf(
          i18n$t("こちらは%sの発生状況をまとめたページです。厚労省のまとめより早く状況を把握できますが、県の集計時間は厚労省の発表時間と完全に一致していないため、タイムラグによる数値の違いが生じる可能性もありますので、予めご注意ください。また、速報では陰性から再び陽性になった人は再計算に含めていないため、自治体発表の陽性者数と数値が異なる場合があります。"),
          i18n$t("福岡県")
        ),
        footer = tagList(
          tags$small(
            icon("github"),
            tags$a(
              href = "https://ckan.open-governmentdata.org/organization/fukuoka-pref",
              i18n$t("自治体オープンデータのCKAN")
            )
          )
        )
      )
    ),
    column(
      width = 7,
      uiOutput("FukuokaValueBoxes") %>% withSpinner(proxy.height = "200px")
    )
  ),
  fluidRow(
    box(
      width = 12,
      closable = F,
      title = tagList(icon("chart-line"), sprintf(i18n$t("%sの発生状況"), i18n$t("福岡県"))),
      fluidRow(
        column(
          width = 6,
          echarts4rOutput("FukuokaContact") %>% withSpinner()
        ),
        column(
          width = 6,
          echarts4rOutput("FukuokaTest") %>% withSpinner()
        )
      ),
      fluidRow(
        column(
          width = 6,
          echarts4rOutput("FukuokaInfectedRoute") %>% withSpinner()
        ),
        column(
          width = 6 # ,
          # echarts4rOutput("FukuokaResidentialTreeMap") %>% withSpinner()
        )
      ),
      footer = tags$small(icon("lightbulb"), i18n$t("凡例クリックすると表示・非表示の切替ができます。"))
    )
  ),
  fluidRow(
    box(
      width = 12,
      closable = F,
      collapsed = T,
      collapsible = T,
      enable_label = T,
      label_text = tagList("クリックして", icon("hand-point-right")),
      label_status = "warning",
      title = tagList("県内の感染者"),
      fluidRow(
        column(
          width = 8,
          echarts4rOutput("FukuokaCluster", height = "600px") %>% withSpinner(proxy.height = "600px"),
          tagList(
            helpText(
              icon("id-card"), "番号：公表日は三週間以内の感染者のみ番号を表示しています。また、番号のボーダーの太さは公表日（直近一週間、二週間、三週間）を示しています。太いほど時間が近い。"
            ),
            helpText(
              icon("shapes"), "シンボル：デフォルトは円形。ダイヤモンド：医療従事者。"
            )
          ),
          dataTableOutput("fukuokaPatientTable") %>% withSpinner()
        ),
        column(
          width = 4,
          uiOutput("fukuokaProfile") %>% withSpinner()
        )
      ) # ,
      # fluidRow(
      #   column(
      #     width = 12,
      #     dataTableOutput("fukuokaPatientTable") %>% withSpinner()
      #   )
      # )
    )
  )
)
