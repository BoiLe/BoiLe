Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Routing
Imports Microsoft.AspNet.FriendlyUrls
Imports Microsoft.AspNet.FriendlyUrls.Resolvers

Module RouteConfig
    Sub RegisterRoutes(ByVal routes As RouteCollection)
        Dim settings = New FriendlyUrlSettings()
        settings.AutoRedirectMode = RedirectMode.Permanent
        routes.EnableFriendlyUrls(settings, New IFriendlyUrlResolver() {New MyWebFormsFriendlyUrlResolver()})
    End Sub

    Public Class MyWebFormsFriendlyUrlResolver
        Inherits WebFormsFriendlyUrlResolver

        Public Sub New()
        End Sub

        Public Overrides Function ConvertToFriendlyUrl(ByVal path As String) As String
            If Not String.IsNullOrEmpty(path) Then

                If path.ToLower().Contains("/ckfinder/") Then
                    Return path
                End If
            End If

            Return MyBase.ConvertToFriendlyUrl(path)
        End Function
    End Class
End Module

