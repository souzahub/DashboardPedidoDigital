object frCadastroUsuario: TfrCadastroUsuario
  Left = 0
  Top = 0
  Width = 1144
  Height = 643
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 1144
    Height = 643
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 1142
      Height = 599
      Hint = ''
      ActivePage = Tab1
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        object UniDBGrid1: TUniDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 1119
          Height = 561
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 5
          BodyRTL = False
          DataSource = DataSourceUsuario
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clWindow
          Columns = <
            item
              FieldName = 'PERFIL'
              Title.Caption = 'PERFIL'
              Width = 49
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 364
            end
            item
              FieldName = 'LOGIN'
              Title.Caption = 'LOGIN'
              Width = 124
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 1134
          Height = 571
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsNone
          Caption = ''
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 1134
            Height = 571
            Hint = ''
            Align = alClient
            Color = clBtnHighlight
            TabOrder = 1
            object UniPanel3: TUniPanel
              Left = 0
              Top = 0
              Width = 1132
              Height = 569
              Hint = ''
              AutoScroll = True
              Align = alClient
              TabOrder = 0
              Caption = ''
              Color = clNone
              LayoutConfig.Cls = 'cor1'
              ScrollHeight = 569
              ScrollWidth = 1132
              object UniLabel2: TUniLabel
                Left = 41
                Top = 40
                Width = 29
                Height = 13
                Hint = ''
                Caption = 'Perfil'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 6
              end
              object UniLabel4: TUniLabel
                Left = 42
                Top = 294
                Width = 35
                Height = 13
                Hint = ''
                Caption = 'Senha'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 7
              end
              object UniLabel6: TUniLabel
                Left = 42
                Top = 109
                Width = 32
                Height = 13
                Hint = ''
                Caption = 'Nome'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 8
              end
              object UniLabel3: TUniLabel
                Left = 42
                Top = 173
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'Login'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 9
              end
              object UniLabel5: TUniLabel
                Left = 42
                Top = 229
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'Email'
                ParentFont = False
                Font.Style = [fsBold]
                TabOrder = 10
              end
              object UniNome: TUniEdit
                Left = 41
                Top = 128
                Width = 289
                Height = 32
                Hint = ''
                CharCase = ecUpperCase
                MaxLength = 60
                Text = 'UNINOME'
                TabOrder = 2
                ClearButton = True
              end
              object UniLogin: TUniEdit
                Left = 41
                Top = 192
                Width = 289
                Height = 32
                Hint = ''
                BodyRTL = False
                CharCase = ecUpperCase
                MaxLength = 30
                Text = 'UNIEDIT1'
                TabOrder = 3
                ClearButton = True
              end
              object UniEmail: TUniEdit
                Left = 42
                Top = 248
                Width = 289
                Height = 32
                Hint = ''
                CharCase = ecLowerCase
                MaxLength = 150
                Text = 'uniedit1'
                TabOrder = 4
                ClearButton = True
              end
              object UniSenha: TUniEdit
                Left = 42
                Top = 313
                Width = 177
                Height = 32
                Hint = ''
                MaxLength = 20
                Text = 'UniEdit1'
                TabOrder = 5
                ClearButton = True
              end
              object UniComboBox1: TUniComboBox
                Left = 41
                Top = 59
                Width = 154
                Hint = ''
                Style = csDropDownList
                MaxLength = 20
                Text = ''
                Items.Strings = (
                  'ADMINISTRADOR'
                  'USU'#193'RIO')
                TabOrder = 1
                CharCase = ecUpperCase
                IconItems = <>
              end
            end
          end
        end
      end
    end
    object PnlCrud: TUniPanel
      Left = 1
      Top = 1
      Width = 1142
      Height = 42
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -20
      Font.Style = [fsBold]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = 'Cadastro de Usu'#225'rios'
      Color = clNone
      object UniLabel1: TUniLabel
        Left = 784
        Top = 24
        Width = 6
        Height = 24
        Hint = ''
        Visible = False
        Caption = '.'
        TabOrder = 1
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
        TabOrder = 2
        OnClick = BtCanxClick
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
        TabOrder = 3
        OnClick = BtGrvxClick
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
        TabOrder = 4
        OnClick = BtExcxClick
      end
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
        TabOrder = 5
        OnClick = BtIncxClick
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
        TabOrder = 6
        OnClick = BtAltxClick
      end
      object EdPesquisar: TUniEdit
        AlignWithMargins = True
        Left = 823
        Top = 2
        Width = 299
        Height = 38
        Hint = ''
        Margins.Top = 2
        Margins.Right = 20
        Margins.Bottom = 2
        ParentShowHint = False
        CharCase = ecUpperCase
        MaxLength = 40
        Text = ''
        ParentFont = False
        Font.Color = clBlack
        Align = alRight
        TabOrder = 7
        EmptyText = 'PESQUISAR'
        ClearButton = True
        FieldLabel = '<i class="fas fa-search"></i>'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Height = -19
        FieldLabelFont.Style = [fsBold]
        OnChange = EdPesquisarChange
      end
    end
  end
  object DataSourceUsuario: TDataSource
    DataSet = dmDados.FDUsuario
    Left = 668
    Top = 10
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 888
    Top = 8
    Images = {
      1400000000000000060600000073613B66613B00000000060B0000006465736B
      746F703B66613B000000000608000000656469743B66613B0000000006090000
      0074726173683B66613B000000000608000000736176653B66613B0000000006
      0B000000726574776565743B66613B0000000006090000006864642D6F3B6661
      3B0000000006070000006375743B66613B00000000060D0000006261722D6368
      6172743B66613B00000000060D0000007069652D63686172743B66613B000000
      00060C000000626F6F6B6D61726B3B66613B00000000060C00000063616C656E
      6461723B66613B000000000608000000666565643B66613B00000000060A0000
      007365617263683B66613B000000000609000000696D6167653B66613B000000
      000609000000696E626F783B66613B0000000006090000006864642D6F3B6661
      3B00000000060E0000004E657749636F6E436C733B66613B0000000006080000
      00706C75733B66613B00000000061100000070656E63696C2D7371756172653B
      66613B}
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    DisplayMessage = ' Buscando . . .'
    Left = 960
    Top = 8
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = clMaroon
    CancelButtonColor = 6835774
    Width = 400
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 732
    Top = 18
  end
end
