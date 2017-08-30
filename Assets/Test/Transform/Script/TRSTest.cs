using UnityEngine;

public class TRSTest : TestBase
{
    Vector3 rotate;
    protected override void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos)
    {
        var translate = Vector3.one * Mathf.Sin(dt);
        rotate += Vector3.one;
        cpu.transform.localPosition = cpuInitPos + translate;
        cpu.transform.rotation = Quaternion.Euler(rotate);
        cpu.transform.localScale = Vector3.one * Mathf.Sin(dt);
        mat.SetVector("_Translate", translate);
        mat.SetVector("_Rotate", rotate);
        mat.SetVector("_Scale", cpu.transform.lossyScale);
    }
}