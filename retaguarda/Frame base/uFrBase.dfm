object frCadCliente: TfrCadCliente
  Left = 0
  Top = 0
  Width = 1446
  Height = 1000
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 1446
    Height = 1000
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 1444
      Height = 956
      Hint = ''
      ActivePage = Tab2
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        object frameFornec: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1436
          Height = 928
          Hint = ''
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          TabOrder = 0
          Columns = <
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRICAO'
              Width = 356
            end
            item
              FieldName = 'ENDERECO'
              Title.Caption = 'ENDERECO'
              Width = 340
            end
            item
              FieldName = 'BAIRRO'
              Title.Caption = 'BAIRRO'
              Width = 184
            end
            item
              FieldName = 'CIDADE'
              Title.Caption = 'CIDADE'
              Width = 152
            end
            item
              FieldName = 'UF'
              Title.Caption = 'UF'
              Width = 36
            end
            item
              FieldName = 'CEP'
              Title.Caption = 'CEP'
              Width = 84
            end
            item
              FieldName = 'FONE'
              Title.Caption = 'FONE'
              Width = 124
            end
            item
              FieldName = 'FANTASIA'
              Title.Caption = 'FANTASIA'
              Width = 415
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 1436
          Height = 928
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsNone
          Caption = ''
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 1436
            Height = 928
            Hint = ''
            Align = alClient
            Color = clBtnHighlight
            TabOrder = 1
            object pnFormCliente: TUniPanel
              AlignWithMargins = True
              Left = 0
              Top = 3
              Width = 1434
              Height = 920
              Hint = ''
              Margins.Left = 0
              Margins.Right = 0
              AutoScroll = True
              Align = alClient
              TabOrder = 0
              BorderStyle = ubsNone
              Caption = ''
              Color = 5321732
              AlwaysOnTop = True
              LayoutConfig.Cls = 'borda'
              DesignSize = (
                1434
                920)
              ScrollHeight = 920
              ScrollWidth = 1434
              object panelCValorTarifa: TUniPanel
                Left = 248
                Top = 32
                Width = 977
                Height = 769
                Hint = ''
                AutoScroll = True
                Anchors = [akTop]
                TabOrder = 1
                Caption = ''
                Color = clBtnHighlight
                LayoutConfig.Cls = 'borda'
                ScrollHeight = 769
                ScrollWidth = 977
                object lbFornec: TUniLabel
                  AlignWithMargins = True
                  Left = 372
                  Top = 13
                  Width = 303
                  Height = 28
                  Hint = ''
                  Margins.Top = 5
                  Margins.Right = 30
                  Caption = 'INFORMA'#199#213'ES DO FORNECEDOR'
                  ParentFont = False
                  Font.Color = clBlack
                  Font.Height = -20
                  Font.Name = 'Yu Gothic UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  Color = clNone
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 1444
      Height = 42
      Hint = ''
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      ParentColor = False
      Color = 5321732
      Align = alTop
      TabOrder = 2
      object cpBusca: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 42
        Hint = ''
        ParentColor = False
        Color = 5321732
        Align = alLeft
        TabOrder = 1
        object BtInc: TUniFSButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = GoogleBlue3Round
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-plus "></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 1
          OnClick = BtIncClick
        end
        object BtAlt: TUniFSButton
          AlignWithMargins = True
          Left = 45
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = GoogleBlue3Round
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="far fa-edit"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 2
          OnClick = BtAltClick
        end
        object BtExc: TUniFSButton
          AlignWithMargins = True
          Left = 87
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = GoogleBlue3Round
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="far fa-trash-alt"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 3
          OnClick = BtExcClick
        end
        object BtGrv: TUniFSButton
          AlignWithMargins = True
          Left = 129
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = GoogleBlue3Round
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-save"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 4
          OnClick = BtGrvClick
        end
        object BtCan: TUniFSButton
          AlignWithMargins = True
          Left = 171
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = GoogleBlue3Round
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-sync"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 5
          OnClick = BtCanClick
        end
      end
      object UniContainerPanel2: TUniContainerPanel
        Left = 976
        Top = 0
        Width = 468
        Height = 42
        Hint = ''
        ParentColor = False
        Color = 5321732
        Align = alRight
        TabOrder = 2
        object EdPesquisar: TUniEdit
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 408
          Height = 36
          Hint = ''
          Margins.Left = 0
          Margins.Right = 10
          ParentShowHint = False
          CharCase = ecUpperCase
          MaxLength = 40
          CharEOL = #13
          Text = ''
          Align = alRight
          TabOrder = 1
          EmptyText = 'PESQUISA DINAMICA'
          ClearButton = True
          OnChange = EdPesquisarChange
        end
        object UniFSButton1: TUniFSButton
          AlignWithMargins = True
          Left = 426
          Top = 5
          Width = 34
          Height = 29
          Hint = ''
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 8
          Margins.Bottom = 8
          StyleButton = Primary
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = ''
          Align = alRight
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'   Ext.creat' +
              'e('#39'Ext.tip.ToolTip'#39', {'#13#10'   target: sender.getEl(),'#13#10'   showDelay' +
              ':50,'#13#10'   hideDelay: 50,'#13#10'   html: "Buscar"'#13#10'  });'#13#10'}')
          ScreenMask.Enabled = True
          ScreenMask.Message = 'Carregando...'
          ImageIndex = 13
          OnClick = UniFSButton1Click
        end
      end
    end
  end
end
