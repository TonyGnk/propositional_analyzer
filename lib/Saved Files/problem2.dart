const String problem2LargeDPLL =
    '6,7,20,10,3,\n0.1,20.0,0.1,\n0.3,20.0,0.1,\n0.4,20.0,0.05,\n0.6,20.0,0.05,\n0.7,20.0,0.0,\n0.9,20.0,0.1,\n1.0,20.0,0.0,\n1.1,20.0,0.0,\n1.3,20.0,0.0,\n1.4,20.0,0.0,\n1.6,20.0,0.0,\n1.7,20.0,0.0,\n1.9,20.0,0.1,\n2.0,20.0,0.0,\n2.1,20.0,0.05,\n2.3,20.0,0.0,\n2.4,20.0,0.0,\n2.6,20.0,0.05,\n2.7,20.0,0.05,\n2.9,20.0,0.0,\n3.0,20.0,0.0,\n3.1,20.0,0.05,\n3.3,20.0,0.0,\n3.4,20.0,0.0,\n3.6,20.0,0.15,\n3.7,20.0,0.15,\n3.9,20.0,0.05,\n4.0,20.0,0.0,\n4.1,20.0,0.2,\n4.3,20.0,0.05,\n4.4,20.0,0.1,\n4.6,20.0,0.05,\n4.7,20.0,0.05,\n4.9,20.0,0.05,\n5.0,20.0,0.0,\n5.1,20.0,0.1,\n5.3,20.0,0.0,\n5.4,20.0,0.0,\n5.6,20.0,0.0,\n5.7,20.0,0.05,\n5.9,20.0,0.0,\n6.0,20.0,0.0,\n6.1,20.0,0.0,\n6.3,20.0,0.0,\n6.4,20.0,0.0,\n6.6,20.0,0.05,\n6.7,20.0,0.0,\n6.9,20.0,0.05,\n7.0,20.0,0.15,\n7.1,20.0,0.0,\n7.3,20.0,0.0,\n7.4,20.0,0.15,\n7.6,20.0,0.0,\n7.7,20.0,0.05,\n7.9,20.0,0.0,\n8.0,20.0,0.05,\n8.1,20.0,0.1,\n8.3,20.0,0.0,\n8.4,20.0,0.0,\n8.6,20.0,0.05,\n8.7,20.0,0.05,\n8.9,20.0,0.0,\n9.0,20.0,0.05,\n9.1,20.0,0.0,\n9.3,20.0,0.1,\n9.4,20.0,0.1,\n9.6,20.0,0.0,\n9.7,20.0,0.05,\n9.9,20.0,0.1,\n10.0,20.0,0.0,\n10.1,20.0,0.1,\n10.3,20.0,0.1,\n10.4,20.0,0.05,\n10.6,20.0,0.15,\n10.7,20.0,0.05,\n10.9,20.0,0.1,\n11.0,20.0,0.05,\n11.1,20.0,0.0,\n11.3,20.0,0.05,\n11.4,20.0,0.1,\n11.6,20.0,0.05,\n11.7,20.0,0.15,\n11.9,20.0,0.0,\n12.0,20.0,0.1,\n12.1,20.0,0.05,\n12.3,20.0,0.05,\n12.4,20.0,0.0,\n12.6,20.0,0.1,\n12.7,20.0,0.05,\n12.9,20.0,0.1,\n13.0,20.0,0.15,\n13.1,20.0,0.1,\n13.3,20.0,0.0,\n13.4,20.0,0.1,\n13.6,20.0,0.05,\n13.7,20.0,0.2,\n13.9,20.0,0.05,\n14.0,20.0,0.1,\n14.1,20.0,0.1,\n14.3,20.0,0.05,\n14.4,20.0,0.15,\n14.6,20.0,0.1,\n14.7,20.0,0.1,\n14.9,20.0,0.0,\n15.0,20.0,0.25,\n15.1,20.0,0.1,\n15.3,20.0,0.1,\n15.4,20.0,0.05,\n15.6,20.0,0.15,\n15.7,20.0,0.1,\n15.9,20.0,0.05,\n16.0,20.0,0.05,\n16.1,20.0,0.0,\n16.3,20.0,0.0,\n16.4,20.0,0.0,\n16.6,20.0,0.2,\n16.7,20.0,0.05,\n16.9,20.0,0.05,\n17.0,20.0,0.0,\n17.1,20.0,0.15,\n17.3,20.0,0.05,\n17.4,20.0,0.1,\n17.6,20.0,0.3,\n17.7,20.0,0.3,\n17.9,20.0,0.15,\n18.0,20.0,0.1,\n18.1,20.0,0.15,\n18.3,20.0,0.05,\n18.4,20.0,0.1,\n18.6,20.0,0.2,\n18.7,20.0,0.1,\n18.9,20.0,0.15,\n19.0,20.0,0.45,\n19.1,20.0,0.15,\n19.3,20.0,0.1,\n19.4,20.0,0.1,\n19.6,20.0,0.1,\n19.7,20.0,0.1,\n19.9,20.0,0.4,\n20.0,20.0,0.25,\n20.1,20.0,0.1,\n20.3,20.0,0.25,\n20.4,20.0,0.15,\n20.6,20.0,0.15,\n20.7,20.0,0.05,\n20.9,20.0,0.3,\n21.0,20.0,0.25,\n21.1,20.0,0.05,\n21.3,20.0,0.15,\n21.4,20.0,0.25,\n21.6,20.0,0.3,\n21.7,20.0,0.2,\n21.9,20.0,0.2,\n22.0,20.0,0.1,\n22.1,20.0,0.3,\n22.3,20.0,0.45,\n22.4,20.0,0.25,\n22.6,20.0,0.1,\n22.7,20.0,0.3,\n22.9,20.0,0.25,\n23.0,20.0,0.2,\n23.1,20.0,0.3,\n23.3,20.0,0.25,\n23.4,20.0,0.25,\n23.6,20.0,0.5,\n23.7,20.0,0.1,\n23.9,20.0,0.25,\n24.0,20.0,0.15,\n24.1,20.0,0.35,\n24.3,20.0,0.15,\n24.4,20.0,0.3,\n24.6,20.0,0.5,\n24.7,20.0,0.15,\n24.9,20.0,0.55,\n25.0,20.0,0.15,\n25.1,20.0,0.4,\n25.3,20.0,0.2,\n25.4,20.0,0.2,\n25.6,20.0,0.45,\n25.7,20.0,0.2,\n25.9,20.0,0.5,\n26.0,20.0,0.2,\n26.1,20.0,0.15,\n26.3,20.0,0.35,\n26.4,20.0,0.4,\n26.6,20.0,0.4,\n26.7,20.0,0.35,\n26.9,20.0,0.4,\n27.0,20.0,0.4,\n27.1,20.0,0.1,\n27.3,20.0,0.5,\n27.4,20.0,0.2,\n27.6,20.0,0.5,\n27.7,20.0,0.3,\n27.9,20.0,0.6,\n28.0,20.0,0.25,\n28.1,19.0,0.3,\n28.3,20.0,0.65,\n28.4,20.0,0.65,\n28.6,20.0,0.35,\n28.7,20.0,0.25,\n28.9,20.0,0.85,\n29.0,20.0,0.45,\n29.1,20.0,0.5,\n29.3,20.0,0.5,\n29.4,20.0,0.4,\n29.6,20.0,0.4,\n29.7,19.0,0.45,\n29.9,20.0,0.35,\n30.0,20.0,0.8,\n30.1,20.0,0.4,\n30.3,19.0,0.85,\n30.4,20.0,0.7,\n30.6,20.0,0.8,\n30.7,20.0,0.75,\n30.9,20.0,0.75,\n31.0,20.0,0.55,\n31.1,20.0,0.7,\n31.3,20.0,0.65,\n31.4,20.0,0.6,\n31.6,19.0,0.85,\n31.7,20.0,0.95,\n31.9,20.0,0.8,\n32.0,18.0,0.45,\n32.1,20.0,0.8,\n32.3,20.0,0.9,\n32.4,20.0,0.9,\n32.6,18.0,0.85,\n32.7,19.0,0.95,\n32.9,19.0,0.8,\n33.0,20.0,0.5,\n33.1,20.0,1.15,\n33.3,19.0,0.7,\n33.4,19.0,0.6,\n33.6,20.0,0.9,\n33.7,19.0,0.8,\n33.9,18.0,0.6,\n34.0,19.0,0.95,\n34.1,19.0,1.2,\n34.3,20.0,1.1,\n34.4,19.0,0.75,\n34.6,19.0,0.45,\n34.7,19.0,0.75,\n34.9,20.0,1.0,\n35.0,17.0,0.75,\n35.1,19.0,0.95,\n35.3,19.0,1.05,\n35.4,17.0,0.7,\n35.6,18.0,1.2,\n35.7,19.0,1.35,\n35.9,20.0,0.55,\n36.0,18.0,1.05,\n36.1,16.0,0.65,\n36.3,16.0,1.3,\n36.4,18.0,0.8,\n36.6,19.0,0.65,\n36.7,18.0,0.6,\n36.9,18.0,1.2,\n37.0,18.0,1.15,\n37.1,19.0,0.85,\n37.3,19.0,1.3,\n37.4,17.0,1.35,\n37.6,18.0,1.0,\n37.7,17.0,0.8,\n37.9,18.0,0.95,\n38.0,19.0,1.35,\n38.1,16.0,1.2,\n38.3,18.0,1.25,\n38.4,18.0,0.9,\n38.6,19.0,1.3,\n38.7,18.0,0.85,\n38.9,18.0,1.55,\n39.0,16.0,0.8,\n39.1,15.0,0.55,\n39.3,17.0,1.1,\n39.4,17.0,1.55,\n39.6,17.0,0.8,\n39.7,17.0,1.0,\n39.9,19.0,1.3,\n40.0,17.0,1.15,\n40.1,15.0,0.9,\n40.3,17.0,1.25,\n40.4,14.0,1.1,\n40.6,16.0,0.6,\n40.7,16.0,1.1,\n40.9,15.0,1.15,\n41.0,16.0,1.4,\n41.1,19.0,1.35,\n41.3,15.0,1.15,\n41.4,12.0,0.95,\n41.6,14.0,0.75,\n41.7,18.0,1.0,\n41.9,14.0,0.65,\n42.0,15.0,1.4,\n42.1,16.0,0.95,\n42.3,15.0,0.95,\n42.4,8.0,0.6,\n42.6,15.0,0.95,\n42.7,11.0,0.7,\n42.9,13.0,1.0,\n43.0,10.0,0.85,\n43.1,11.0,0.8,\n43.3,13.0,1.2,\n43.4,11.0,0.85,\n43.6,15.0,1.2,\n43.7,17.0,1.25,\n43.9,15.0,1.25,\n44.0,9.0,0.9,\n44.1,11.0,0.85,\n44.3,14.0,1.25,\n44.4,14.0,1.35,\n44.6,12.0,1.0,\n44.7,15.0,0.75,\n44.9,14.0,0.9,\n45.0,16.0,1.25,\n45.1,8.0,0.35,\n45.3,11.0,1.05,\n45.4,8.0,0.65,\n45.6,12.0,0.85,\n45.7,16.0,1.3,\n45.9,12.0,0.75,\n46.0,11.0,1.25,\n46.1,9.0,0.6,\n46.3,7.0,0.5,\n46.4,9.0,0.45,\n46.6,10.0,0.9,\n46.7,12.0,1.25,\n46.9,14.0,2.05,\n47.0,14.0,1.5,\n47.1,11.0,0.75,\n47.3,9.0,0.75,\n47.4,10.0,1.0,\n47.6,11.0,1.0,\n47.7,11.0,0.65,\n47.9,10.0,1.1,\n48.0,5.0,0.35,\n48.1,6.0,0.6,\n48.3,11.0,0.75,\n48.4,10.0,0.55,\n48.6,11.0,1.4,\n48.7,11.0,0.95,\n48.9,10.0,0.95,\n49.0,9.0,1.05,\n49.1,13.0,1.15,\n49.3,7.0,0.65,\n49.4,10.0,1.0,\n49.6,10.0,0.8,\n49.7,8.0,0.75,\n49.9,1.0,0.1,\n50.0,10.0,0.75,\n50.1,8.0,0.65,\n50.3,5.0,0.35,\n50.4,9.0,0.8,\n50.6,9.0,0.85,\n50.7,12.0,0.85,\n50.9,9.0,0.95,\n51.0,8.0,0.4,\n51.1,8.0,0.75,\n51.3,10.0,1.0,\n51.4,8.0,1.05,\n51.6,10.0,1.0,\n51.7,9.0,1.2,\n51.9,6.0,0.5,\n52.0,6.0,0.7,\n52.1,5.0,0.55,\n52.3,6.0,0.5,\n52.4,6.0,0.35,\n52.6,8.0,1.05,\n52.7,4.0,0.6,\n52.9,8.0,1.75,\n53.0,9.0,1.5,\n53.1,9.0,0.65,\n53.3,3.0,0.15,\n53.4,5.0,0.55,\n53.6,3.0,0.1,\n53.7,5.0,1.1,\n53.9,5.0,0.7,\n54.0,3.0,0.6,\n54.1,4.0,0.6,\n54.3,2.0,0.1,\n54.4,4.0,0.55,\n54.6,7.0,0.25,\n54.7,6.0,0.6,\n54.9,4.0,0.25,\n55.0,5.0,0.5,\n55.1,6.0,0.6,\n55.3,1.0,0.15,\n55.4,7.0,0.5,\n55.6,5.0,0.65,\n55.7,4.0,0.2,\n55.9,4.0,0.6,\n56.0,5.0,0.45,\n56.1,6.0,0.55,\n56.3,5.0,0.5,\n56.4,1.0,0.0,\n56.6,5.0,0.55,\n56.7,3.0,0.25,\n56.9,4.0,0.25,\n57.0,7.0,0.7,\n57.1,9.0,1.05,\n57.3,4.0,0.45,\n57.4,3.0,0.3,\n57.6,5.0,0.8,\n57.7,5.0,0.2,\n57.9,1.0,0.2,\n58.0,3.0,0.15,\n58.1,3.0,0.4,\n58.3,4.0,0.25,\n58.4,4.0,0.6,\n58.6,6.0,1.15,\n58.7,3.0,0.4,\n58.9,5.0,0.15,\n59.0,1.0,0.05,\n59.1,2.0,0.2,\n59.3,6.0,0.8,\n59.4,4.0,0.4,\n59.6,1.0,0.15,\n59.7,4.0,0.4,\n59.9,4.0,0.55,\n60.0,3.0,0.45,\n60.1,3.0,0.25,\n60.3,1.0,0.15,\n60.4,3.0,0.4,\n60.6,1.0,0.1,\n60.7,0.0,0.0,\n60.9,4.0,0.1,\n61.0,3.0,0.35,\n61.1,1.0,0.25,\n61.3,7.0,0.85,\n61.4,3.0,0.45,\n61.6,4.0,0.3,\n61.7,0.0,0.0,\n61.9,3.0,0.45,\n62.0,0.0,0.0,\n62.1,2.0,0.15,\n62.3,2.0,0.2,\n62.4,1.0,0.0,\n62.6,3.0,0.2,\n62.7,3.0,0.4,\n62.9,2.0,0.3,\n63.0,3.0,0.25,\n63.1,3.0,0.35,\n63.3,5.0,0.85,\n63.4,3.0,0.3,\n63.6,3.0,0.4,\n63.7,1.0,0.1,\n63.9,5.0,0.7,\n64.0,1.0,0.25,\n64.1,1.0,0.2,\n64.3,2.0,0.25,\n64.4,1.0,0.2,\n64.6,1.0,0.0,\n64.7,3.0,0.7,\n64.9,0.0,0.0,\n65.0,2.0,0.35,\n65.1,1.0,0.25,\n65.3,2.0,0.15,\n65.4,2.0,0.25,\n65.6,3.0,0.55,\n65.7,2.0,0.05,\n65.9,1.0,0.15,\n66.0,1.0,0.0,\n66.1,1.0,0.05,\n66.3,3.0,0.55,\n66.4,1.0,0.2,\n66.6,3.0,0.35,\n66.7,3.0,0.15,\n66.9,3.0,0.7,\n67.0,2.0,0.3,\n67.1,3.0,0.4,\n67.3,1.0,0.1,\n67.4,2.0,0.3,\n67.6,2.0,0.2,\n67.7,1.0,0.05,\n67.9,0.0,0.0,\n68.0,1.0,0.25,\n68.1,0.0,0.0,\n68.3,1.0,0.2,\n68.4,1.0,0.35,\n68.6,2.0,0.6,\n68.7,2.0,0.2,\n68.9,1.0,0.15,\n69.0,2.0,0.15,\n69.1,1.0,0.2,\n69.3,0.0,0.0,\n69.4,0.0,0.0,\n69.6,0.0,0.0,\n69.7,2.0,0.35,\n69.9,3.0,0.45,\n70.0,0.0,0.0,\n70.1,2.0,0.35,\n70.3,4.0,0.45,\n70.4,0.0,0.0,\n70.6,1.0,0.0,\n70.7,2.0,0.45,\n70.9,1.0,0.15,\n71.0,0.0,0.0,\n71.1,1.0,0.05,\n71.3,0.0,0.0,\n71.4,2.0,0.25,\n71.6,0.0,0.0,\n71.7,0.0,0.0,\n71.9,1.0,0.0,\n72.0,2.0,0.25,\n72.1,2.0,0.2,\n72.3,0.0,0.0,\n72.4,4.0,0.45,\n72.6,1.0,0.15,\n72.7,0.0,0.0,\n72.9,0.0,0.0,\n73.0,1.0,0.1,\n73.1,1.0,0.25,\n73.3,0.0,0.0,\n73.4,1.0,0.3,\n73.6,0.0,0.0,\n73.7,0.0,0.0,\n73.9,0.0,0.0,\n74.0,1.0,0.0,\n74.1,0.0,0.0,\n74.3,0.0,0.0,\n74.4,0.0,0.0,\n74.6,0.0,0.0,\n74.7,0.0,0.0,\n';