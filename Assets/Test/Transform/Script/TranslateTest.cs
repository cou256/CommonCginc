using UnityEngine;

public class TranslateTest : TestBase
{
    protected override void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos)
    {
        var translate = Vector3.one * Mathf.Sin(dt);
        cpu.transform.localPosition = cpuInitPos + translate;
        mat.SetVector("_Translate", translate);
    }
}