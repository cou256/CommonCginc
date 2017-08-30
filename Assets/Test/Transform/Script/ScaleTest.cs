using System;
using UnityEngine;

public class ScaleTest : TestBase
{
    protected override void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos)
    {
        cpu.transform.localScale = Vector3.one * Mathf.Sin(dt);
        mat.SetVector("_Scale", cpu.transform.lossyScale);
    }
}