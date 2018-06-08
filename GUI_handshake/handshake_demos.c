#include <gtk/gtk.h>
#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>

G_MODULE_EXPORT void load_yaml_cb(GtkButton *load_yaml, gpointer data)
{
  printf("loading: conf.yaml\n");
  system("rosparam load $(rospack find qb_interface)/conf/config.yaml");
}


G_MODULE_EXPORT void run_qb_force_corntrol_cb(GtkButton *run_qb_force_corntrol, gpointer data)
{
  printf("starting: qb_force_control\n");
    system("rosrun qb_interface qb_force_control");
}

G_MODULE_EXPORT void run_rosserial_arduino_sensors_cb(GtkButton *run_rosserial_arduino_sensors, gpointer data)
{
  printf("starting: FSR sensors\n");

    system("gnome-terminal -x sh -c \"rosrun rosserial_python  serial_node.py /dev/ttyACM0; bash\"");

}

G_MODULE_EXPORT void run_demo1_cb(GtkButton *run_demo1, gpointer data)
{
  printf("starting: OpenClose\n");

    system("gnome-terminal -x sh -c \"rosrun qb_interface OpenClose; bash\"");
}

G_MODULE_EXPORT void run_demo2_cb(GtkButton *run_demo2, gpointer data)
{
  printf("starting: FSRtoClosure\n");

    system("gnome-terminal -x sh -c \"rosrun qb_interface FSRtoClosure; bash\"");
}

G_MODULE_EXPORT void run_demo3_cb(GtkButton *run_demo3, gpointer data)
{
  printf("starting: hand_detect_closure\n");
    system("gnome-terminal -x sh -c \"rosrun qb_interface hand_detect_closure; bash\"");
}



int
main (int argc, char *argv[])
{
        GtkBuilder  *builder;
        GtkWidget   *window;

        gtk_init (&argc, &argv);

        builder = gtk_builder_new ();
        gtk_builder_add_from_file (builder, "handshake_demos.glade", NULL);

        window = GTK_WIDGET (gtk_builder_get_object (builder, "window1"));
        gtk_builder_connect_signals (builder, NULL);
        g_object_unref (G_OBJECT (builder));

        gtk_widget_show (window);
        gtk_main ();
          return 0;
}
