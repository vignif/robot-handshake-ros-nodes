#include <stdlib.h>
#include <gtk/gtk.h>
#include <gdk/gdkkeysyms.h>
#include <glib/gprintf.h>
#include <ros/ros.h>

typedef struct {
GtkWidget *window1 ;
GtkWidget *button1;
GtkWidget *label1;
}AppWidgets;

G_MODULE_EXPORT void on_button1_clicked(GtkButton *button,
                    gpointer user_data)
{
  AppWidgets * app = (AppWidgets *) user_data;

  gtk_label_set_text(GTK_LABEL(app->label1),"Hello World!");
}

int main (int argc, char *argv[])
{

 GtkBuilder  *builder;
 AppWidgets  *app=g_slice_new(AppWidgets) ;
 GError  *err=NULL;

 gtk_init(&argc, &argv);

 builder = gtk_builder_new();
 gtk_builder_add_from_file (builder, "GUI", &err);

 #define appGET(xx) \
 app->xx=GTK_WIDGET(gtk_builder_get_object(builder,#xx))

 appGET(window1);
 appGET(button1);
 appGET(label1);


 gtk_builder_connect_signals(builder, app);
 g_object_unref(G_OBJECT(builder));


 gtk_widget_show(app->window1);
 gtk_main ();
 return 0;
}
