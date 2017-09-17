using UnityEngine;

public class ColorTest : MonoBehaviour
{
    public Color color;
    [SerializeField] Shader toHsvTest, toRgbTest;
    [SerializeField] GameObject hsv, rgb; 
    Material toHsvMat, toRgbMat;
    float h, s, v;
    void Start()
    {
        toHsvMat = new Material(toHsvTest);
        toRgbMat = new Material(toRgbTest);
        hsv.GetComponent<Renderer>().material = toHsvMat;
        rgb.GetComponent<Renderer>().material = toRgbMat;
    }
    void Update()
    {
        toHsvMat.SetColor("_Color", color);
        Color.RGBToHSV(color, out h, out s, out v);
        toRgbMat.SetFloat("_H", h);
        toRgbMat.SetFloat("_S", s);
        toRgbMat.SetFloat("_V", v);
    }
}
